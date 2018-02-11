# uscented transform
'''
    1. main flow
        we first define a gaussian distribution, then compute lambda
        then compute sigma points corresponding to mu and sigma
        then transform sigma points 
        finally recover mu and sigma
    Also plot original distribution with sampled data VS transformed distribution and transformed sigma data for comparison
''' 

'''
    2. compute sigma point
        there are 2n*1 sigma points, first one is mu
        from 1:n, it's mu+addTerm, from n+1:2n, it's mu-addTerm
        compute weights: 
            compute mu's weight separately
            compute all other weights using formula
    note:sqrtm() returns principal squre root of matrix, one can use chol for Cholesky decomposition 
'''

'''
    3. transform
        there are already some functions implemented inside, choose one. usually this should be your odometry model
'''

'''    
    4. recover gaussian
        compute mu and sigma
        use bscfun() to apply operation element-wise
'''

'''
    5. change parameters such as alpha, number of sigma points, see how they affect result
'''