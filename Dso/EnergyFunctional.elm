module Dso.EnergyFunctional exposing (..)

import Array exposing (Array)
import Dict exposing (Dict)
import Dso.EnergyFunctionalStructs exposing (EFFrame, EFPoint, EFResidual)
import Dso.HessianBlocks exposing (CalibHessian, FrameHessian, PointHessian)
import Dso.IndexThreadReduce exposing (IndexThreadReduce)
import Dso.NumType exposing (Mat18f, Mat88, Mat88f, MatXX, Vec10, VecC, VecCf, VecX)
import Dso.Residuals exposing (PointFrameResidual)
import External.Eigen as Eigen


-- UNKNOWN ###########################################################


type AccumulatedTopHessianSSE
    = AccumulatedTopHessianSSE


type AccumulatedSCHessianSSE
    = AccumulatedSCHessianSSE



-- MODEL #############################################################


type alias EnergyFunctional =
    { frames : Array EFFrame
    , nPoints : Int
    , nFrames : Int
    , nResiduals : Int
    , hM : MatXX
    , bM : VecX
    , resInA : Int
    , resInL : Int
    , resInM : Int
    , lastHS : MatXX
    , lastbS : VecX
    , lastX : VecX

    -- null spaces
    , lastNullspaces_forLogging : Array VecX
    , lastNullspaces_pose : Array VecX
    , lastNullspaces_scale : Array VecX
    , lastNullspaces_affA : Array VecX
    , lastNullspaces_affB : Array VecX

    -- stuff
    , red : IndexThreadReduce Vec10
    , connectivityMap : Dict Int Eigen.Vector2i

    -- private
    , adHTdeltaF : Mat18f
    , adHost : Mat88
    , adTarget : Mat88
    , adHostF : Mat88f
    , adTargetF : Mat88f
    , cPrior : VecC
    , cDeltaF : VecCf
    , cPriorF : VecCf
    , accSSE_top_L : AccumulatedTopHessianSSE
    , accSSE_top_A : AccumulatedTopHessianSSE
    , accSSE_bot : AccumulatedSCHessianSSE
    , allPoints : Array EFPoint
    , allPointsToMarg : Array EFPoint
    , currentLambda : Float
    }



-- FUNCTIONS #########################################################


insertResidual : PointFrameResidual -> EnergyFunctional -> ( EFResidual, EnergyFunctional )
insertResidual r self =
    Debug.crash "TODO"


insertFrame : FrameHessian -> CalibHessian -> EnergyFunctional -> ( EFFrame, EnergyFunctional )
insertFrame fh hCalib self =
    Debug.crash "TODO"


insertPoint : PointHessian -> EnergyFunctional -> ( EFPoint, EnergyFunctional )
insertPoint ph self =
    Debug.crash "TODO"


dropResidual : EFResidual -> EnergyFunctional -> EnergyFunctional
dropResidual r self =
    Debug.crash "TODO"


marginalizeFrame : EFFrame -> EnergyFunctional -> EnergyFunctional
marginalizeFrame fh self =
    Debug.crash "TODO"


removePoint : EFPoint -> EnergyFunctional -> EnergyFunctional
removePoint ph self =
    Debug.crash "TODO"


marginalizePointsF : EnergyFunctional -> EnergyFunctional
marginalizePointsF self =
    Debug.crash "TODO"


dropPointsF : EnergyFunctional -> EnergyFunctional
dropPointsF self =
    Debug.crash "TODO"


solveSystemF : Int -> Float -> CalibHessian -> EnergyFunctional -> EnergyFunctional
solveSystemF iteration lambda hCalib self =
    Debug.crash "TODO"


calcMEnergyF : EnergyFunctional -> Float
calcMEnergyF self =
    Debug.crash "TODO"


calcLEnergyF_MT : EnergyFunctional -> Float
calcLEnergyF_MT self =
    Debug.crash "TODO"


makeIDX : EnergyFunctional -> EnergyFunctional
makeIDX self =
    Debug.crash "TODO"


setDeltaF : CalibHessian -> EnergyFunctional -> EnergyFunctional
setDeltaF hCalib self =
    Debug.crash "TODO"


setAdjointsF : CalibHessian -> EnergyFunctional -> EnergyFunctional
setAdjointsF hCalib self =
    Debug.crash "TODO"



-- private functions


getStitchedDeltaF : EnergyFunctional -> VecX
getStitchedDeltaF self =
    Debug.crash "TODO"


resubstituteF_MT : VecX -> Bool -> CalibHessian -> EnergyFunctional -> ( CalibHessian, EnergyFunctional )
resubstituteF_MT x mt hCalib self =
    Debug.crash "TODO"


{-| Variable stats is not used ...
-}
resubstituteFPt : VecCf -> Mat18f -> Int -> Int -> Vec10 -> Int -> EnergyFunctional -> EnergyFunctional
resubstituteFPt xc xAd min max stats tid self =
    Debug.crash "TODO"


accumulateAF_MT : MatXX -> VecX -> Bool -> EnergyFunctional -> EnergyFunctional
accumulateAF_MT h b mt self =
    Debug.crash "TODO"


accumulateLF_MT : MatXX -> VecX -> Bool -> EnergyFunctional -> EnergyFunctional
accumulateLF_MT h b mt self =
    Debug.crash "TODO"


accumulateSCF_MT : MatXX -> VecX -> Bool -> EnergyFunctional -> EnergyFunctional
accumulateSCF_MT h b mt self =
    Debug.crash "TODO"


calcLEnergyPt : Int -> Int -> Vec10 -> Int -> EnergyFunctional -> ( EnergyFunctional, Vec10 )
calcLEnergyPt min max stats tid self =
    Debug.crash "TODO"


orthogonalize : VecX -> MatXX -> EnergyFunctional -> ( EnergyFunctional, VecX, MatXX )
orthogonalize b h self =
    Debug.crash "TODO"
