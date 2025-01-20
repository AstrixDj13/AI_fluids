# AI_fluids

The code explains how to analyse oscillatory flows using a volume averaged Navier Stokes Framework.
It uses various deep neural network archictectures with customized loss functions to see how a purely data driven approach behaves and can it reproduce the same results that a DNS can produce.

It takes input as a the pressure gradient and time lagged superficial acceleration as input.

These time lags are created using two ways;
1) Using Linear Inpterpolation
2) First 5 modes of Laguerre Polynomials.

Ultimately results are produced for validation to see if both a priori and a posteriori works or not.