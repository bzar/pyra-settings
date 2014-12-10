.pragma library

function zeroPad(ii, n) {
  var is = ii.toString();
  for(var i = is.length; i < n; ++i)  {
    is = "0" + is;
  }
  return is;
}
