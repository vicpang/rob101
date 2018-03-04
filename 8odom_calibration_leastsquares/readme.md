# odometry calibration using least squares

## problem set up
    1. data source: row odometry and motion estimation from scan matching
    2. calibraiton: scan matched motion are viewed as ground truth, we need to estimate the parameters of our calibration model 

## main flow
    1. load both data in, perform calibration 
    2. apply the estimated transformation to odometry data
    3. compute the trajectory, plot and compare

## calibraiton step
      1. main algorithm
        initialize H,b, omega and X, here X is the transformation matrix
        iterate through observations:
            accumulate H,b
        solve delta_X
        update X
      2. we need to handlers: both from the formula
            compute error
            compute jacobian
      3. note we update X only once here, in general we can run several loops

## apply model
    directy apply using matrix multiply

## compute trajectory
    1. trajectory is stored in a matrix: Nx3 matrix, robot pose is stored in a (N+1)x3 matrix
    2. apply calibrated odometry information to pose 
    3. each  vector corresponds to a transform matrix in homogeneous coordinates, so to apply odometry
        currentPose = currentPose*v2t(U(i,:));
        T(i+1,:) = t2v(currentPose);

## result
    as seen in the plot folder, the calibrated odometry is much better than raw odometry, but there is no test data