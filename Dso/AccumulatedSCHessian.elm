module Dso.AccumulatedSCHessian exposing (..)

import Array exposing (Array)
import Dso.AvoidCyclic exposing (EnergyFunctional)
import Dso.EnergyFunctionalStructs exposing (EFPoint)
import Dso.HessianBlocks
import Dso.IndexThreadReduce exposing (IndexThreadReduce)
import Dso.MatrixAccumulators exposing (AccumulatorApprox)
import Dso.NumType exposing (MatXX, Vec10, VecX)


-- MODEL #############################################################


type alias AccumulatedSCHessianSSE =
    { nframes : Array Int
    , acc : Array AccumulatorApprox
    , nres : Array Int
    }



-- FUNCTIONS #########################################################


setZero : Int -> Int -> Int -> Int -> AccumulatedSCHessianSSE -> AccumulatedSCHessianSSE
setZero n min max tid self =
    Debug.crash "TODO"


stitchDouble : EnergyFunctional -> Int -> AccumulatedSCHessianSSE -> ( AccumulatedSCHessianSSE, MatXX, VecX )
stitchDouble ef tid self =
    Debug.crash "TODO"


stitchDoubleMT : IndexThreadReduce Vec10 -> EnergyFunctional -> Bool -> AccumulatedSCHessianSSE -> ( AccumulatedSCHessianSSE, MatXX, VecX )
stitchDoubleMT red ef mt self =
    Debug.crash "TODO"


addPoint : EFPoint -> Bool -> Int -> AccumulatedSCHessianSSE -> AccumulatedSCHessianSSE
addPoint p shiftPriorToZero tid self =
    Debug.crash "TODO"


addPointsInternal : Array EFPoint -> Bool -> Int -> Int -> Int -> AccumulatedSCHessianSSE -> AccumulatedSCHessianSSE
addPointsInternal points shiftPriorToZero min max tid self =
    Debug.crash "TODO"



-- private


stitchDoubleInternal : EnergyFunctional -> Int -> Int -> Int -> AccumulatedSCHessianSSE -> ( AccumulatedSCHessianSSE, MatXX, VecX )
stitchDoubleInternal ef min max tid self =
    Debug.crash "TODO"
