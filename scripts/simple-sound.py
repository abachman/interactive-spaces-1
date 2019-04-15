from Adafruit_IO import Client
from datetime import datetime
import time
import numpy

# seeeeeecrets
from secrets import secrets

# local help libraries
from utils import identity, mathutils, logger, lttb, color, data_sender

# local SOUND detection library
from sound_detector import sound_detector

try:
    import board
    import adafruit_dotstar as dotstar
    DOTCOUNT = 16 # FIXME: there's a lot more than this
    dots = dotstar.DotStar(board.SCK, board.MOSI, DOTCOUNT, brightness=0.8)
except:
    dots = fake_dotstars.FakeDotstars()

##
# TODO: add constants for sound reactive LEDs (which pixels are local, which are remote)
##

class DetectionHandler:
    def __init__(self, client, feed_key):
        self.client = client
        self.feed_key = feed_key
        self.logger = logger.Logger("logs/sound.log")

        # current, max, min
        self.levels = []

        # TODO: we'd like it to receive, as well

    def on_setup(self, *args):
        message = "starting sound detector on {}".format(identity.get_identity())
        print(message)
        self.client.send_data("monitor", message)
        self.logger.debug(message)

        # LED startup signal
        for i in range(16):
            dots[i] = (100, 100, 100)
            time.sleep(0.1)

        for i in range(16):
            dots[i] = (0, 0, 0)
            time.sleep(0.1)

    # every frame
    def on_update(self, score):

        self.levels.append([time.time(), int(score)])
        print(score)

        # TODO: update LEDs according to sound level <here>

    # every time score passes threshold
    def on_trigger(self, score, max_score):
        # print("  detected sound with score {}, max {}".format(score, max_score))
        pass

    # every time `interval_seconds` passes
    def on_interval(self, score):
        out_value = score

        if len(self.levels) > 30:
            # limit output data to 30 samples
            np_levels = numpy.array(self.levels)
            lttb_result = lttb.downsample(np_levels, 30)
            out_value = ' '.join("%i" % v[1] for v in lttb_result)
        elif len(self.levels) > 0:
            out_value = ' '.join("%i" % v[1] for v in self.levels)

        print()
        print("------------------------------")
        print("send sound data with score {}".format(out_value))
        print("------------------------------")
        print()

        self.client.send_data(self.feed_key, out_value)
        self.logger.info(out_value)

        self.levels = []
        # TODO: (maybe) signal data sent with LEDs <here>

## setup Adafruit IO client
ADAFRUIT_IO_USERNAME = secrets.get("ADAFRUIT_IO_USERNAME")
ADAFRUIT_IO_KEY = secrets.get("ADAFRUIT_IO_KEY")
if ADAFRUIT_IO_USERNAME == None or ADAFRUIT_IO_KEY == None:
    print("make sure ADAFRUIT_IO_USERNAME and ADAFRUIT_IO_KEY are set in secrets.py:")
    print("")
    print(
        """
        secrets = {
            'ADAFRUIT_IO_USERNAME': 'io username',
            'ADAFRUIT_IO_KEY': 'io key'"
        }"""
    )
    print("")
    exit(1)
aio = data_sender.DataSender(ADAFRUIT_IO_USERNAME, ADAFRUIT_IO_KEY, debug=True)

# initialize DetectionHandler with adafruit IO client and a feed to update
handler = DetectionHandler(aio, "sound")

# initialize MotionDetector with the event handler and proper settings
detector = sound_detector.SoundDetector(
    handler, interval_seconds=3, trigger_threshold=400, headless=True
)

# start the whole thing, run forever
detector.run()
