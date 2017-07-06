function z = q3fLine(lambda) % F in the search direction V
global X FUNC S
z = feval(FUNC,X+lambda*S);