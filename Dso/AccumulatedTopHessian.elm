module Dso.AccumulatedTopHessian exposing (..)

import Array exposing (Array)
import Dso.EnergyFunctional exposing (EnergyFunctional)
import Dso.EnergyFunctionalStructs exposing (EFPoint)
import Dso.IndexThreadReduce exposing (IndexThreadReduce)
import Dso.MatrixAccumulators exposing (AccumulatorApprox)
import Dso.NumType exposing (MatXX, Vec10, VecX)


-- MODEL #############################################################


type alias AccumulatedTopHessianSSE =
    { nframes : Array Int
    , acc : Array AccumulatorApprox
    , nres : Array Int
    }



-- FUNCTIONS #########################################################


setZero : Int -> Int -> Int -> Int -> AccumulatedTopHessianSSE -> AccumulatedTopHessianSSE
setZero nFrames min max tid self =
    Debug.crash "TODO"


stitchDouble : EnergyFunctional -> Bool -> Bool -> Int -> AccumulatedTopHessianSSE -> ( AccumulatedTopHessianSSE, MatXX, VecX )
stitchDouble ef usePrior useDelta tid self =
    Debug.crash "TODO"


stitchDoubleMT : IndexThreadReduce Vec10 -> EnergyFunctional -> Bool -> Bool -> AccumulatedTopHessianSSE -> ( AccumulatedTopHessianSSE, MatXX, VecX )
stitchDoubleMT red ef usePrior mt self =
    Debug.crash "TODO"


addPoint : EFPoint -> EnergyFunctional -> Int -> AccumulatedTopHessianSSE -> AccumulatedTopHessianSSE
addPoint p ef tid self =
    Debug.crash "TODO"


addPointsInternal : Array EFPoint -> EnergyFunctional -> Int -> Int -> Int -> AccumulatedTopHessianSSE -> AccumulatedTopHessianSSE
addPointsInternal points ef min max tid self =
    Debug.crash "TODO"



-- private


stitchDoubleInternal : EnergyFunctional -> Bool -> Int -> Int -> Int -> AccumulatedTopHessianSSE -> ( AccumulatedTopHessianSSE, MatXX, VecX )
stitchDoubleInternal ef usePrior min max tid self =
    Debug.crash "TODO"
