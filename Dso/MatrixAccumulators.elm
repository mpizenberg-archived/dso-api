module Dso.MatrixAccumulators exposing (..)

import Array exposing (Array)
import Dso.NumType exposing (Mat1313f, Mat1414f, Mat99f, Vec14f, Vec9f)
import External.Eigen as Eigen
import External.SSE as SSE


-- MODEL #############################################################


type alias AccumulatorXX =
    { a : Eigen.Matrix
    , a1k : Eigen.Matrix
    , a1m : Eigen.Matrix
    , num : Int

    -- private
    , numIn1 : Float
    , numIn1k : Float
    , numIn1m : Float
    }


type alias Accumulator11 =
    { a : Float
    , num : Int

    -- private
    , sseData : Array Float
    , sseData1k : Array Float
    , sseData1m : Array Float
    , numIn1 : Float
    , numIn1k : Float
    , numIn1m : Float
    }


type alias AccumulatorX =
    { a : Eigen.Matrix
    , a1k : Eigen.Matrix
    , a1m : Eigen.Matrix
    , num : Int

    -- private
    , numIn1 : Float
    , numIn1k : Float
    , numIn1m : Float
    }


type alias Accumulator14 =
    { h : Mat1414f
    , b : Vec14f
    , num : Int

    -- private
    , sseData : Array Float
    , sseData1k : Array Float
    , sseData1m : Array Float
    , numIn1 : Float
    , numIn1k : Float
    , numIn1m : Float
    }


{-| Computes the outer sum of 10x2 matrices, weighted with a 2x2 matrix:

    H = [x y] * [a b; b c] * [x y]^T

Assuming x, y are column vectors.
Numerically robust to large sums.

-}
type alias AccumulatorApprox =
    { h : Mat1313f
    , num : Int

    -- private
    , data : Array Float
    , data1k : Array Float
    , data1m : Array Float
    , topRight_Data : Array Float
    , topRight_Data1k : Array Float
    , topRight_Data1m : Array Float
    , botRight_Data : Array Float
    , botRight_Data1k : Array Float
    , botRight_Data1m : Array Float
    , numIn1 : Float
    , numIn1k : Float
    , numIn1m : Float
    }


type alias Accumulator9 =
    { h : Mat99f
    , b : Vec9f
    , num : Int

    -- private
    , sseData : Array Float
    , sseData1k : Array Float
    , sseData1m : Array Float
    , numIn1 : Float
    , numIn1k : Float
    , numIn1m : Float
    }



-- FUNCTIONS #########################################################


initializeXX : AccumulatorXX
initializeXX =
    Debug.crash "TODO"


finishXX : AccumulatorXX -> AccumulatorXX
finishXX model =
    Debug.crash "TODO"


updateXX : Eigen.Matrix -> Eigen.Matrix -> Float -> AccumulatorXX -> AccumulatorXX
updateXX l r w model =
    Debug.crash "TODO"


shiftUpXX : Bool -> AccumulatorXX -> AccumulatorXX
shiftUpXX force model =
    Debug.crash "TODO"



-- Accumulator11 methods


initialize11 : Accumulator11
initialize11 =
    Debug.crash "TODO"


finish11 : Accumulator11 -> Accumulator11
finish11 model =
    Debug.crash "TODO"


updateSingle11 : Float -> Accumulator11 -> Accumulator11
updateSingle11 val model =
    Debug.crash "TODO"


updateSingleNoShift11 : Float -> Accumulator11 -> Accumulator11
updateSingleNoShift11 val model =
    Debug.crash "TODO"


updateSSENoShift11 : SSE.M128 -> Accumulator11 -> Accumulator11
updateSSENoShift11 val model =
    Debug.crash "TODO"


shiftUp11 : Bool -> Accumulator11 -> Accumulator11
shiftUp11 force model =
    Debug.crash "TODO"



-- AccumulatorX methods


initializeX : AccumulatorX
initializeX =
    Debug.crash "TODO"


finishX : AccumulatorX -> AccumulatorX
finishX model =
    Debug.crash "TODO"


updateX : Eigen.Matrix -> Float -> AccumulatorX -> AccumulatorX
updateX l w model =
    Debug.crash "TODO"


updateNoWeightX : Eigen.Matrix -> AccumulatorX -> AccumulatorX
updateNoWeightX l model =
    Debug.crash "TODO"


shiftUpX : Bool -> AccumulatorX -> AccumulatorX
shiftUpX force model =
    Debug.crash "TODO"



-- Accumulator14 methods


initialize14 : Accumulator14
initialize14 =
    Debug.crash "TODO"


finish14 : Accumulator14 -> Accumulator14
finish14 model =
    Debug.crash "TODO"


updateSSE : Array SSE.M128 -> Accumulator14 -> Accumulator14
updateSSE vals model =
    Debug.crash "TODO"


updateSingle14 : Array Float -> Int -> Accumulator14 -> Accumulator14
updateSingle14 vals off model =
    Debug.crash "TODO"


shiftUp14 : Bool -> Accumulator14 -> Accumulator14
shiftUp14 force model =
    Debug.crash "TODO"



-- AccumulatorApprox methods


initializeApprox : AccumulatorApprox
initializeApprox =
    Debug.crash "TODO"


finishApprox : AccumulatorApprox -> AccumulatorApprox
finishApprox model =
    Debug.crash "TODO"


updateSSEApprox : Array Float -> Array Float -> Array Float -> AccumulatorApprox -> AccumulatorApprox
updateSSEApprox x y abc model =
    Debug.crash "TODO"


updateApprox : Array Float -> Array Float -> Array Float -> Array Float -> Array Float -> AccumulatorApprox -> AccumulatorApprox
updateApprox x4 x6 y4 y6 abc model =
    Debug.crash "TODO"


updateTopRightApprox : Array Float -> Array Float -> Array Float -> Array Float -> Array Float -> AccumulatorApprox -> AccumulatorApprox
updateTopRightApprox x4 x6 y4 y6 tr23 model =
    Debug.crash "TODO"


updateBotRightApprox : Array Float -> AccumulatorApprox -> AccumulatorApprox
updateBotRightApprox a23 model =
    Debug.crash "TODO"


shiftUpApprox : Bool -> AccumulatorApprox -> AccumulatorApprox
shiftUpApprox force model =
    Debug.crash "TODO"



-- Accumulator9 methods


initialize9 : Accumulator9
initialize9 =
    Debug.crash "TODO"


finish9 : Accumulator9 -> Accumulator9
finish9 model =
    Debug.crash "TODO"


updateSSE9 : Array SSE.M128 -> Accumulator9 -> Accumulator9
updateSSE9 vals model =
    Debug.crash "TODO"


updateSSE9_eighted : Array SSE.M128 -> SSE.M128 -> Accumulator9 -> Accumulator9
updateSSE9_eighted vals w model =
    Debug.crash "TODO"


updateSingle9 : Array Float -> Int -> Accumulator9 -> Accumulator9
updateSingle9 vals off model =
    Debug.crash "TODO"


updateSingleWeighted9 : Array Float -> Float -> Int -> Accumulator9 -> Accumulator9
updateSingleWeighted9 vals w off model =
    Debug.crash "TODO"


shiftUp9 : Bool -> Accumulator9 -> Accumulator9
shiftUp9 force model =
    Debug.crash "TODO"
