#program initial.
  % State of each cell (on/off)
  h(cl(X,Y),V) :- cell(X,Y,V).

  adj(X,Y,X,Y) :- cell(X,Y,_).
  adj(X,Y,X+1,Y) :- cell(X,Y,_), X<dim-1.
  adj(X,Y,X-1,Y) :- cell(X,Y,_), X>0.
  adj(X,Y,X,Y+1) :- cell(X,Y,_), Y<dim-1.
  adj(X,Y,X,Y-1) :- cell(X,Y,_), Y>0.
  
#program dynamic.
  % Switch if there were made odd number of changes          
  switch(X,Y) :- _cell(X,Y,_), #count{A,B: tog(A,B), _adj(X,Y,A,B)}=N, N\2=1.
  
  h(cl(X,Y),off) :- switch(X,Y), 'h(cl(X,Y),on).
  h(cl(X,Y),on) :- switch(X,Y), 'h(cl(X,Y),off).
    
% Inertia: c(F,V)=value V has changed
  h(F,V) :- 'h(F,V), not c(F).
  c(F)   :- 'h(F,V), h(F,W), V!=W.  

% Action generation
  { tog(X,Y) : _cell(X,Y,_) }.
  #minimize{1,X,Y: tog(X,Y)}.

#program final.
  :- h(cl(_,_),on).

#show tog/2.