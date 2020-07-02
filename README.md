# ANCR
Affine Non-negative Collaborative Representation

ANCR sloves the following problem,<br>
<a href="https://www.codecogs.com/eqnedit.php?latex=\underset{\boldsymbol{c}}{\textrm{min}}&space;\&space;\left&space;\|&space;\boldsymbol{y}-\mathbf{X}\boldsymbol{c}&space;\right&space;\|_2^2&plus;\lambda\left&space;\|&space;\boldsymbol{c}&space;\right&space;\|_2^2,&space;\&space;\textrm{s.t.}&space;\&space;\boldsymbol{c}\geq&space;0,\boldsymbol{1}^T\boldsymbol{c}=1" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\underset{\boldsymbol{c}}{\textrm{min}}&space;\&space;\left&space;\|&space;\boldsymbol{y}-\mathbf{X}\boldsymbol{c}&space;\right&space;\|_2^2&plus;\lambda\left&space;\|&space;\boldsymbol{c}&space;\right&space;\|_2^2,&space;\&space;\textrm{s.t.}&space;\&space;\boldsymbol{c}\geq&space;0,\boldsymbol{1}^T\boldsymbol{c}=1" title="\underset{\boldsymbol{c}}{\textrm{min}} \ \left \| \boldsymbol{y}-\mathbf{X}\boldsymbol{c} \right \|_2^2+\lambda\left \| \boldsymbol{c} \right \|_2^2, \ \textrm{s.t.} \ \boldsymbol{c}\geq 0,\boldsymbol{1}^T\boldsymbol{c}=1" /></a>

where y is a test sample, X is the dictionary, and c is the corresponding coding vector of y on X.
