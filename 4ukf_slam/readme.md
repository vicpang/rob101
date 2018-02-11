# ukf slam
'''
    1. main flow
        the algorithm is divided into two steps as usual, prediciton and correction
        For initialization, mu is zero, sigma is near zero, and a scalar for computer lambda
'''
'''
    2. prediction step
        Purpose: take current mu, sigma and odometry, predict mu and sigma for the next state
        Steps:
            (1) compute sigma points
            (2) transform using odometry model, rememer to normalize angle
            (3) compute weights
            (4) recover mu
            (5) recover sigma and ADD NOISE
'''