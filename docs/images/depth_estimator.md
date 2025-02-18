graph LR;
    %% Set default styles for all edges
    linkStyle default stroke:#0000FF,stroke-width:1px,font-size:10px;

    %% depth_estimator_factory
    classDef factory fill:#f9f,stroke:#333,stroke-width:2px;
    class depth_estimator_factory factory;

    %% DepthEstimatorType types as intermediates
    classDef type fill:#ffdd99,stroke:#333,stroke-width:2px;
    class DepthEstimatorType fill:#ffdd99,stroke:#333,stroke-width:2px;
    class DepthEstimatorType_DepthAnythingV2 fill:#ffdd99,stroke:#333,stroke-width:2px;
    class DepthEstimatorType_DepthPro fill:#ffdd99,stroke:#333,stroke-width:2px;

    %% DepthEstimator types (final classes)
    classDef estimator fill:#f9f,stroke:#333,stroke-width:2px;
    class DEPTH_ANYTHING_V2 estimator;
    class DEPTH_PRO estimator;

    depth_estimator_factory -->|*depth_estimator_type*| DEPTH_ANYTHING_V2;
    depth_estimator_factory -->|*depth_estimator_type*| DEPTH_PRO;
    depth_estimator_factory -->|*depth_estimator_type*| DEPTH_SGBM;
    depth_estimator_factory -->|*depth_estimator_type*| DEPTH_RAFT_STEREO;
    depth_estimator_factory -->|*depth_estimator_type*| DEPTH_CRESTEREO;    
    depth_estimator_factory -->|*depth_estimator_type*| DEPTH_CRESTEREO_PYTORCH;    


    DEPTH_ANYTHING_V2 -->|*_creates_*| DepthEstimatorDepthAnythingV2;
    DEPTH_PRO -->|*_creates_*| DepthEstimatorDepthPro;
    DEPTH_SGBM -->|*_creates_*| DepthEstimatorSgbm;
    DEPTH_RAFT_STEREO -->|*_creates_*| DepthEstimatorRaftStereo;
    DEPTH_CRESTEREO -->|*_creates_*| DepthEstimatorCrestereo;  
    DEPTH_CRESTEREO_PYTORCH -->|*_creates_*| DepthEstimatorCrestereoPytorch;            

    %% DepthEstimator classes
    classDef depthEstimator fill:#f9f,stroke:#333,stroke-width:2px;
    class DepthEstimator depthEstimator;

    DepthEstimator -->|*_has-a_*| camera
    DepthEstimator -->|*_has-a_*| device
    DepthEstimator -->|*_has-a_*| model        

    DepthEstimatorDepthAnythingV2 -->|*_is-a_*| DepthEstimator;
    DepthEstimatorDepthPro -->|*_is-a_*| DepthEstimator;
    DepthEstimatorSgbm -->|*_is-a_*| DepthEstimator;
    DepthEstimatorRaftStereo -->|*_is-a_*| DepthEstimator;
    DepthEstimatorCrestereo -->|*_is-a_*| DepthEstimator;
    DepthEstimatorCrestereoPytorch -->|*_is-a_*| DepthEstimator;

    %% DepthEstimator dependencies
    classDef dependencies fill:#ddf,stroke:#333,stroke-width:2px;
    class Camera dependencies;

    camera -->|*_is-a_*| Camera;
