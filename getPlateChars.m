function [a,b,c,d,e,f] = getPlateChars(a,b,c,d,e,f,gray)
a = toBinary(a, gray);
b = toBinary(b, gray);
c = toBinary(c, gray);
d = toBinary(d, gray);
e = toBinary(e, gray);
f = toBinary(f, gray);
a = detectLetter(a);
b = detectLetter(b);
c = detectLetter(c);
d = detectLetter(d);
e = detectLetter(e);
f = detectLetter(f);
end