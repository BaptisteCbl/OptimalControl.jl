# --------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------
#
# ocp
t0 = 0.0                # t0 is fixed
tf = 1.0                # tf is fixed
x0 = [-1.0; 0.0]        # the initial condition is fixed
xf = [0.0; 0.0]        # the target
A = [0.0 1.0
      0.0 0.0]
B = [0.0; 1.0]
f(x, u) = A * x + B * u[1];  # dynamics
L(x, u) = 0.5 * u[1]^2   # integrand of the Lagrange cost
ocp = OptimalControlProblem(L, f, t0, x0, tf, xf, 2, 1)

# solution
u_sol(t) = 6.0-12.0*t

# 
struct DummyProblem <: AbstractOptimalControlProblem
end
prob = DummyProblem()
@test_throws InconsistentArgument solve(prob)

# --------------------------------------------------------------------------------------------------
#
# initialization
ocp_c = convert(ocp, UncFreeXfProblem)

#
@test typeof(ocp) == UncFixedXfProblem
@test typeof(ocp_c) == UncFreeXfProblem

# init=nothing, grid=nothing => init=zeros(m, N-1), grid=range(t0, tf, N), with N=__grid_size()
init_, grid_ = make_udss_init(ocp_c, nothing, nothing)
@test init_ == __init(ocp_c)
@test grid_ == __grid(ocp_c)

# init=nothing, grid=T => init=zeros(m, N-1), grid=T, with N=length(T) (check validity)
N = floor(Int64, __grid_size()/2) # pour avoir un N différent de __grid_size()
grid = range(t0, tf, N)
init_, grid_ = make_udss_init(ocp_c, nothing, grid)
N = length(grid)
@test init_ == __init(ocp_c, N)
@test grid_ == grid
@test_throws InconsistentArgument make_udss_init(ocp_c, nothing, range(t0-1, tf, N))
@test_throws InconsistentArgument make_udss_init(ocp_c, nothing, range(t0, tf+1, N))
@test_throws InconsistentArgument make_udss_init(ocp_c, nothing, range(tf, t0, N))

# init=U, grid=nothing => init=U, grid=range(t0, tf, N), with N=__grid_size()
N = floor(Int64, __grid_size()/2) # pour avoir un N différent de __grid_size()
T = range(t0, tf, N)
U = [[u_sol(T[i])-1.0] for i = 1:N-1]
init_, grid_ = make_udss_init(ocp_c, U, nothing, __init_interpolation())
@test init_ ≈ convert_init([[u_sol(grid_[i])-1.0] for i = 1:__grid_size()-1]) atol=1e-4
@test grid_ == __grid(ocp_c)

# init=U, grid=T => init=U, grid=T (check validity with ocp and with init)
N = floor(Int64, __grid_size()/2) # pour avoir un N différent de __grid_size()
T = range(t0, tf, N)
U = [[u_sol(T[i])-1.0] for i = 1:N-1]
init_, grid_ = make_udss_init(ocp_c, U, T)
@test init_ == convert_init(U)
@test grid_ == T
@test_throws InconsistentArgument make_udss_init(ocp_c, U, range(t0-1, tf, N))
@test_throws InconsistentArgument make_udss_init(ocp_c, U, range(t0, tf+1, N))
@test_throws InconsistentArgument make_udss_init(ocp_c, U, range(tf, t0, N))
@test_throws InconsistentArgument make_udss_init(ocp_c, U, range(t0, tf, 2*N))

# init=(T,U), grid=nothing => init=U, grid=range(t0, tf, N), with N=__grid_size() (check validity with ocp and with U)
N = floor(Int64, __grid_size()/2) # pour avoir un N différent de __grid_size()
T = range(t0, tf, N)
U = [[u_sol(T[i])-1.0] for i = 1:N-1]
init_, grid_ = make_udss_init(ocp_c, (T,U), nothing, __init_interpolation())
@test init_ ≈ convert_init([[u_sol(grid_[i])-1.0] for i = 1:__grid_size()-1]) atol=1e-4
@test grid_ == __grid(ocp_c)
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(t0-1, tf, N), U), nothing, __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(t0, tf+1, N), U), nothing, __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(tf, t0, N), U), nothing, __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(t0, tf, 2*N), U), nothing, __init_interpolation())

# init=(T1,U), grid=T2 => init=U, grid=T2 (check validity with ocp (T1, T2) and with U (T1))
N1 = floor(Int64, __grid_size()/2) # pour avoir un N différent de __grid_size()
T1 = range(t0, tf, N1)
U  = [[u_sol(T[i])-1.0] for i = 1:N1-1]
N2 = floor(Int64, __grid_size()/4) # pour avoir un N différent de __grid_size()
T2 = range(t0, tf, N2)
init_, grid_ = make_udss_init(ocp_c, (T1,U), T2, __init_interpolation())
@test init_ ≈ convert_init([[u_sol(grid_[i])-1.0] for i = 1:N2-1]) atol=1e-4
@test grid_ == T2
# T1
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(t0-1, tf, N), U), T2, __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(t0, tf+1, N), U), T2, __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(tf, t0, N), U), T2, __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (range(t0, tf, 2*N), U), T2, __init_interpolation())
# T2
@test_throws InconsistentArgument make_udss_init(ocp_c, (T1, U), range(t0-1, tf, N), __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (T1, U), range(t0, tf+1, N), __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, (T1, U), range(tf, t0, N), __init_interpolation())

# init=S, grid=nothing => init=S.U, grid=range(t0, tf, N), with N=__grid_size()
N = floor(Int64, __grid_size()/2)
T = range(t0, tf, N)
U = [[u_sol(T[i])-1.0] for i = 1:N-1]
sol = solve(ocp_c, :descent, init=U, grid=T, iterations=0, display=false)
init_, grid_ = make_udss_init(ocp_c, sol, nothing, __init_interpolation())
@test init_ ≈ convert_init([[u_sol(grid_[i])-1.0] for i = 1:__grid_size()-1]) atol=1e-4
@test grid_ == __grid(ocp_c)

# init=S, grid=T => init=S.U, grid=T (check validity with ocp)
N = floor(Int64, __grid_size()/2)
T = range(t0, tf, N)
U = [[u_sol(T[i])-1.0] for i = 1:N-1]
sol = solve(ocp_c, :descent, init=U, grid=T, iterations=0, display=false)
N2 = floor(Int64, __grid_size()/4) # pour avoir un N différent de __grid_size()
T2 = range(t0, tf, N2)
init_, grid_ = make_udss_init(ocp_c, sol, T2, __init_interpolation())
@test init_ ≈ convert_init([[u_sol(grid_[i])-1.0] for i = 1:N2-1]) atol=1e-4
@test grid_ == T2

@test_throws InconsistentArgument make_udss_init(ocp_c, sol, range(t0-1, tf, N), __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, sol, range(t0, tf+1, N), __init_interpolation())
@test_throws InconsistentArgument make_udss_init(ocp_c, sol, range(tf, t0, N), __init_interpolation())

# init=u, grid=nothing => init=u(T), grid=T=range(t0, tf, N), with N=__grid_size()
u_init(t) = [u_sol(t)-1.0]
init_, grid_ = make_udss_init(ocp_c, u_init, nothing)
@test init_ ≈ convert_init([[u_sol(grid_[i])-1.0] for i = 1:__grid_size()-1]) atol=1e-4
@test grid_ == __grid(ocp_c)

# init=u, grid=T => init=u(T), grid=T (check validity with ocp)
u_init(t) = [u_sol(t)-1.0]
N = floor(Int64, __grid_size()/2)
T = range(t0, tf, N)
init_, grid_ = make_udss_init(ocp_c, u_init, T)
@test init_ ≈ convert_init([[u_sol(T[i])-1.0] for i = 1:N-1]) atol=1e-4
@test grid_ == T

@test_throws InconsistentArgument make_udss_init(ocp_c, u_init, range(t0-1, tf, N))
@test_throws InconsistentArgument make_udss_init(ocp_c, u_init, range(t0, tf+1, N))
@test_throws InconsistentArgument make_udss_init(ocp_c, u_init, range(tf, t0, N))

# --------------------------------------------------------------------------------------------------
# resolution
#
# init, grid
N = floor(Int64, __grid_size()/2)
T = range(t0, tf, N)
U = [[u_sol(T[i])-1.0] for i = 1:N-1]

N_ = floor(Int64, __grid_size()/4)
T_ = range(t0, tf, N_)

u_init(t) = [u_sol(t)-1.0]

# resolution with different init
common_args = (iterations=5, display=false)
sol = solve(ocp, :descent, init=nothing, grid=nothing; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=nothing, grid=T; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=U, grid=nothing; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=U, grid=T; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=(T,U), grid=nothing; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=(T,U), grid=T_; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=sol, grid=nothing; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=u_init, grid=nothing; common_args...); @test typeof(sol) == UncFixedXfSolution;
sol = solve(ocp, :descent, init=u_init, grid=T; common_args...); @test typeof(sol) == UncFixedXfSolution;

# plots
@test typeof(plot(sol)) == Plots.Plot{Plots.GRBackend}
@test typeof(plot(sol, :time, (:control, 1))) == Plots.Plot{Plots.GRBackend}