module Dso.CoarseTracker exposing (CoarseTracker)

import Array exposing (Array)
import Dso.HessianBlocks exposing (CalibHessian, FrameHessian, PointHessian)
import Dso.NumType exposing (AffLight, Mat33f, Mat88, SE3, Vec3, Vec3f, Vec5, Vec6, Vec8, Vec8f)
import Dso.Residuals exposing (PointFrameResidual)
import External.Eigen exposing (Vector2i)


-- UNKNOWN ###########################################################


type Output3DWrapper
    = Output3DWrapper


type Accumulator9
    = Accumulator9



-- MODEL #############################################################


type alias CoarseTracker =
    { debugPrint : Bool
    , debugPlot : Bool

    -- pyramid levels
    , k : Array Mat33f
    , ki : Array Mat33f
    , fx : Array Float
    , fy : Array Float
    , fxi : Array Float
    , fyi : Array Float
    , cx : Array Float
    , cy : Array Float
    , cxi : Array Float
    , cyi : Array Float
    , w : Array Int
    , h : Array Int

    -- stuff
    , lastRef : FrameHessian
    , lastRef_aff_g2l : AffLight
    , newFrame : FrameHessian
    , refFrameID : Int

    -- act as pure output
    , lastResiduals : Vec5
    , lastFlowIndicators : Vec3
    , firstCoarseRMSE : Float

    -- Private from now on
    -- stuff
    , idepth : Array Float
    , weightSums : Array Float
    , weightSums_bak : Array Float

    -- pc buffers
    , pc_u : Array (Array Float)
    , pc_v : Array (Array Float)
    , pc_idepth : Array (Array Float)
    , pc_color : Array (Array Float)
    , pc_n : Array Int

    -- warped buffer
    , buf_warped_idepth : Array Float
    , buf_warped_u : Array Float
    , buf_warped_v : Array Float
    , buf_warped_dx : Array Float
    , buf_warped_dy : Array Float
    , buf_warped_residual : Array Float
    , buf_warped_weight : Array Float
    , buf_warped_refColor : Array Float
    , buf_warped_n : Int
    , ptrToDelete : Array Int
    , acc : Accumulator9
    }


type alias CoarseDistanceMap =
    { fwdWarpdIDDistFinal : Array Float

    -- pyramid levels
    , k : Array Mat33f
    , ki : Array Mat33f
    , fx : Array Float
    , fy : Array Float
    , fxi : Array Float
    , fyi : Array Float
    , cx : Array Float
    , cy : Array Float
    , cxi : Array Float
    , cyi : Array Float
    , w : Array Int
    , h : Array Int

    -- private stuff
    , coarseProjectionGrid : Array PointFrameResidual
    , coarseProjectionGridNum : Array Int
    , bfsList1 : Vector2i
    , bfsList2 : Vector2i
    }



-- FUNCTIONS #########################################################


initCoarseTracker : Int -> Int -> CoarseTracker
initCoarseTracker w h =
    Debug.crash "TODO"


{-| Rmq: wrap is not used in function.
-}
trackNewestCoarse : FrameHessian -> SE3 -> AffLight -> Int -> Vec5 -> Output3DWrapper -> CoarseTracker -> ( CoarseTracker, SE3, AffLight, Bool )
trackNewestCoarse newFrameHessian lastToNew_out aff_g2l_out coarsestLvl minResForAbort wrap model =
    Debug.crash "TODO"


setCoarseTrackingRef : Array FrameHessian -> CoarseTracker -> CoarseTracker
setCoarseTrackingRef frameHessians model =
    Debug.crash "TODO"


makeK : CalibHessian -> CoarseTracker -> CoarseTracker
makeK hCalib model =
    Debug.crash "TODO"


debugPlotIDepthMap : Float -> Float -> Array Output3DWrapper -> CoarseTracker -> CoarseTracker
debugPlotIDepthMap minID maxID wraps model =
    Debug.crash "TODO"


debugPlotIDepthMapFloat : Array Output3DWrapper -> CoarseTracker -> CoarseTracker
debugPlotIDepthMapFloat wraps model =
    Debug.crash "TODO"



-- Private from now on


makeCoarseDepthL0 : Array FrameHessian -> CoarseTracker -> CoarseTracker
makeCoarseDepthL0 frameHessians model =
    Debug.crash "TODO"


{-| LOL function not even implemented ...
-}
calcResAndGS : Int -> Mat88 -> Vec8 -> SE3 -> AffLight -> Float -> CoarseTracker -> ( CoarseTracker, Vec6 )
calcResAndGS lvl h_out b_out refToNew aff_g2l cutoffTH model =
    Debug.crash "TODO"


calcRes : Int -> SE3 -> AffLight -> Float -> CoarseTracker -> ( CoarseTracker, Vec6 )
calcRes lvl refToNew aff_g2l cutoffTH model =
    Debug.crash "TODO"


{-| Rmq: refToNew not used.
-}
calcGSSSE : Int -> SE3 -> AffLight -> CoarseTracker -> ( CoarseTracker, Mat88, Vec8 )
calcGSSSE lvl refToNew aff_g2l model =
    Debug.crash "TODO"


{-| LOL function also not implemented.
-}
calcGS : Int -> SE3 -> AffLight -> CoarseTracker -> ( CoarseTracker, Mat88, Vec8 )
calcGS lvl refToNew aff_g2l model =
    Debug.crash "TODO"



-- CoarseDistanceMap methods


initCoarseDistanceMap : Int -> Int -> CoarseDistanceMap
initCoarseDistanceMap w h =
    Debug.crash "TODO"


makeDistanceMap : Array FrameHessian -> FrameHessian -> CoarseDistanceMap -> CoarseDistanceMap
makeDistanceMap frameHessians frame model =
    Debug.crash "TODO"


makeInlierVotes : Array FrameHessian -> CoarseDistanceMap -> CoarseDistanceMap
makeInlierVotes frameHessians model =
    Debug.crash "TODO"


makeKDistanceMap : CalibHessian -> CoarseDistanceMap -> CoarseDistanceMap
makeKDistanceMap hCalib model =
    Debug.crash "TODO"


addIntoDistFinal : Int -> Int -> CoarseDistanceMap -> CoarseDistanceMap
addIntoDistFinal u v model =
    Debug.crash "TODO"



-- private CoarseDistanceMap methods


growDistBFS : Int -> CoarseDistanceMap -> CoarseDistanceMap
growDistBFS bfsNum model =
    Debug.crash "TODO"
