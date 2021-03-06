import java.util.Date;

long getTimestampFromArgs() {
  if (args != null) {
    return Long.parseLong(args[0]);
  } else {
    // unix epoch timestamp
    return (new Date()).getTime() / 1000;
  }
}

long now() {
  return (new Date()).getTime() / 1000;
}
