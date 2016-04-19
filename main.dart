import 'dart:io';

int calculate(int l, int w, int h){
  int lw = l*w;
  int wh = w*h;
  int hl = h*l;
  int res = (2*(lw) ) + (2*(wh)) + (2*hl);
  if(lw < wh && lw < hl) {
    res+=lw;
  }
  if(wh < lw && wh < hl) {
    res+=wh;
  }
  if(hl < lw && hl < wh) {
    res+=hl;
  }
  return res;

}

main(List<String> args) {
  var cont= new File('/home/jayjah/config.txt');
  int res = 0;
  RegExp expr = new RegExp("[0-9]?[0-9]x[0-9][0-9]?x[0-9][0-9]?");
  Iterable<Match> matches = expr.allMatches(cont.readAsStringSync());
  for(Match m in matches) {
    int l,w,h = 0;
    String match = m.group(0);
    var lwh= match.split("x");
    for(int i=0;i<lwh.length;i++) {
      l = int.parse(lwh[0]);
      w = int.parse(lwh[1]);
      h = int.parse(lwh[2]);
    }
    res += calculate(l,w,h);
  }
  print(res);
}
