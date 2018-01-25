module Dso.Settings exposing (..)


defines =
    { pyrLevel_keyframesPerSecond = 0

    -- Parameters controlling when KF's are taken
    -- #####################################################
    -- if /= 0, takes a fixed number of KF per second
    , setting_keyframesPerSecond = 0

    -- if true, takes as many KF as possible
    -- will break the system if the camera stays stationary
    , setting_realTimeMaxKf = False
    , setting_maxShiftWeightT = 0.04 * (640 + 480)
    , setting_maxShiftWeightR = 0 * (640 + 480)
    , setting_maxShiftWeightRT = 0.02 * (640 + 480)

    -- general weight on threshold
    -- the larger the more KF are taken
    -- (e.g. 2 double the amount of KF)
    , setting_maxAffineWeight = 2

    -- Initial hessian values to fix unobservable dimensions
    -- / priors on affine lighting parameters
    -- #####################################################
    , setting_idepthFixPrior = 50 * 50
    , setting_idepthFixPriorMargFac = 600 * 600
    , setting_initialRotPrior = 10 ^ 11
    , setting_initialTransPrior = 10 ^ 10
    , setting_initialAffBPrior = 10 ^ 14
    , setting_initialAffAPrior = 10 ^ 14
    , setting_initialCalibHessian = 5 * (10 ^ 9)

    -- Some modes for solving the resulting linear system
    -- e.g. orthogonalize wrt. unobservable dimensions
    -- #####################################################
    , setting_solverMode = [ Solver_fix_lambda, Solver_orthogonalize_x_later ]
    , setting_solverModeDelta = 0.00001
    , setting_forceAceptStep = True

    -- Some thresholds on when to activate / marginalize points
    -- #####################################################
    , setting_minIdepthH_act = 100
    , setting_minIdepthH_marg = 50

    -- immature points per frame
    , setting_desiredImmatureDensity = 1500

    -- aimed total points in the active window
    , setting_desiredPointDensity = 2000

    -- marg a frame if less than X% points remain
    , setting_minPointsRemaining = 0.05

    -- marg a frame if factor between intensities to current frame is larger than 1/X or X
    , setting_maxLogAffFacInWindow = 0.7

    -- min and max frames in window
    , setting_minFrames = 5
    , setting_maxFrames = 7
    , setting_minFrameAge = 1

    -- min and max GN iterations
    , setting_minOptIterations = 1
    , setting_maxOptIterations = 6

    -- factor on break threshold for GN iterations
    -- larger = break earlier
    , setting_thOptIterations = 1.2

    -- Outlier threshold on photometric energy
    -- #####################################################
    -- higer -> less strict
    , setting_outlierTH = 12 * 12
    , setting_outlierTHSumComponent = 50 * 50

    -- point patter used. Disabled
    , setting_pattern = 8

    -- factor on hessian when marginalizing,
    -- to account for inaccurate linearization points
    , setting_margWeightFac = 0.5 * 0.5

    -- when to re-track a frame?
    -- #####################################################
    -- larger -> re-track more often
    , setting_reTrackThreshold = 1.5

    -- require some minimum number of residuals for a point to become valid
    -- #####################################################
    , setting_minGoodActiveResForMarg = 3
    , setting_minGoodResForMarg = 4

    -- photometric calibration
    -- #####################################################
    -- 0 = nothing, 1 = apply inv. response, 2 = apply inv. response and remove V
    , setting_photometricCalibration = 2
    , setting_useExposure = True

    -- -1 -> fix, 0 -> optimize, > 0 -> optimize with prior
    , setting_affineOptModeA = 10 ^ 12
    , setting_affineOptModeB = 10 ^ 8

    -- 1 = use original intensity for pixel selection
    -- 0 = use gamma-corrected intensity
    , setting_gammaWeightsPixelSelect = 1

    -- Huber threshold
    , setting_huberTH = 9

    -- controlling adaptive energy threshold computation
    -- #####################################################
    , setting_frameEnergyTHConstWeight = 0.5
    , setting_frameEnergyTHN = 0.7
    , setting_frameEnergyTHFacMedian = 1.5
    , setting_overallEnergyTHWeight = 1
    , setting_coarseCutoffTH = 20

    -- controlling pixel selection
    -- #####################################################
    , setting_minGradHistCut = 0.5
    , setting_minGradHistAdd = 7
    , setting_gradDownweightPerLevel = 0.75
    , setting_selectDirectionDistribution = True

    -- controlling initial immature point tracking
    -- #####################################################
    -- max length of the epipolar line segment searched during immature point tracking
    -- relative to image resolution
    , setting_maxPixSearch = 0.027
    , setting_minTraceQuality = 3
    , setting_minTraceTestRadius = 2
    , setting_GNItsOnPointActivation = 3

    -- stepsize for initial discrete search
    , setting_trace_stepsize = 1

    -- max number of GN iterations
    , setting_trace_GNIterations = 3

    -- GN stop after this stepsize
    , setting_trace_GNThreshold = 0.1

    -- for energy-based outlier check, be slightly more relaxed by this factor
    , setting_trace_extraSlackOnTh = 1.2

    -- if pixel-interval is smaller than this, leave it be
    , setting_trace_slackInterval = 1.5
    , setting_trace_minImprovementFactor = 2

    -- benchmarking different undistortion settings
    -- #####################################################
    , benchmarkSetting_fxfyfac = 0
    , benchmarkSetting_width = 0
    , benchmarkSetting_height = 0
    , benchmark_varNoise = 0
    , benchmark_varBlurNoise = 0
    , benchmark_initializerSlacFactor = 1
    , benchmark_noiseGridsize = 3

    -- debug stuff
    , freeDebugParam1 = 1
    , freeDebugParam2 = 1
    , freeDebugParam3 = 1
    , freeDebugParam4 = 1
    , freeDebugParam5 = 1

    -- stuff
    , disableReconfigure = False
    , debugSaveImages = False
    , multiThreading = True
    , disableAllDisplay = False
    , setting_onlyLogKFPoses = True
    , setting_logStuff = True

    -- stuff
    , goStepByStep = False

    -- rendering stuff
    , setting_render_displayCoarseTrackingFull = False
    , setting_render_renderWindowFrames = True
    , setting_render_plotTrackingFull = False
    , setting_render_display3D = True
    , setting_render_displayResidual = True
    , setting_render_displayVideo = True
    , setting_render_displayDepth = True

    -- stuff
    , setting_fullResetRequested = False
    , setting_debugout_runquiet = False

    -- not actually a setting, only some legacy stuff for coarse initializer
    , sparsityFactor = 5
    }


type Solver
    = Solver_svd
    | Solver_orthogonalize_system
    | Solver_orthogonalize_pointmarg
    | Solver_orthogonalize_full
    | Solver_orthogonalize_x
    | Solver_orthogonalize_x_later
    | Solver_svd_cut7
    | Solver_remove_poseprior
    | Solver_use_gn
    | Solver_fix_lambda
    | Solver_momentum
    | Solver_stepmomentum


type StaticPattern
    = PatternPoint
    | PatternCross
    | Pattern3x3Checker
    | Pattern3x3Full
    | Pattern3x3DiagChecker
    | Pattern5x5Checker
    | Pattern5x5Full
    | Pattern8
    | Pattern5x5DiagChecker
    | Pattern9x9Checker
