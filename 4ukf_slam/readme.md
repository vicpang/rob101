# ukf slam

## algorithm overview
    ukf is just another way of linearization. It is using sampling method to estimate a gaussian under non-linear transform. All other things are very similar to slam.

## prediction step
    1. first thing we do is compute sigma points (implemented before), then compute transformation using odometry model(remember to normalize).
    2 we calculate weighted sum to get predicted miu and sigma. Details include:
        - Add noise to covaraince 
        - compute average angle: compute weighted sum first, then atan2()
    3.  landmark poses in miu are stacked in the order by which they were observed. Use a map vector to keep track

## correction step 1  
    1. overall, correction is a loop over all observations at current time.  if it is first time observing a landmark(state maintained in a map vector), we initialize it and add it to state.
    2. adding a new landmark
        - update miu: stack its range and bearing to miu 
        - update sigma: add diag block Q to uncertainty
        - landmark xy: sample sigma points, do a transform using sensor model, compute x and y and store in the last 2 components. This is because we stacked two new entries in miu!
        - correction: recover miu and sigma using weighted sum, then go to next iteration 
    3. representation 
        - sigma points generated are Nx(2N+1), and length of miu is changing, but the first 3 are robot pose

## correction step 2
    1. if the landmark has been seen before, then for this observation we need to compute another unscented transform, since we face another non-linear function h(), our sensor model 
    2. for current landmark, find its x and y using its id in the generated sigma points.   
    3. compute the transformed sigma points using sensor model 
    4. compute expected observation (range , bearing), and it variance, don't forget to add noise 
    5. compute kalman gain and update miu, sigma with true observation

## summary
    1. in this implementation, we are not using a fixed-length miu and sigma, but rather grow their size as we see more and more landmark. So in the update step, we iterate over all observations at that timestep and update the state. if a landmark has not been seen before, we stack it.
    2. we see each landmark will affect all the previous seen landmarks.