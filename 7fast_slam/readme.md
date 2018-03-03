# fast slam 1 

## main flow
    1 the main flow of the algorithm is rather simple. 
        1.1 we choose number of particles, and intialize their weight, pose as zero, history as empty. 
        1.2 initialize all landmarks as unobserved, zero mean and zero covariance
    2 with time goes by:
        2.1 prediction step: taking particles, noise and odometry model to generate particles at next step 
        2.2 use sensor data for correction, update landmark state as well as assigning weights for those particles
        2.3 resample particles according to their weights

## prediction step
    1. for each particle, first add an element to its history cell
    2. sample a command with noise: (r1,r2,trans) as normend(u,noise)
    3. move each particle using sampled odometry and motion model

## correction step 
    1. flow (compare algorithm on notes)
    for each particle:
        iterate over all measurements at this time stamp:
            get id of current obversed landmark
            if this landmark is not observer, then initialize:
                mu using first observation and observation model
                get jacobian, compute sigma,init weights
                set landmark as observed
            endif 
            else we do state update:
            use measurement model to get jacobian and predicted observation
            update measurement covariance with unupdated state covariance 
            calculate kalman gain
            compute difference between prediction and true observation 
            update mu and sigma of landmark state
            calculate particle weights using the formula
        end
    end 
    2. key idea:
        we use 2x2 EKF to update landmark state 
        we use difference between prediction and true observation to calculate weights
## resample 
    well defined algorithms to resample particles, walking along the wheel
    note weights of new particles will be re-assigned



