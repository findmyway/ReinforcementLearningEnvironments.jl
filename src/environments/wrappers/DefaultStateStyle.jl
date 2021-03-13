export DefaultStateStyleEnv

struct DefaultStateStyleEnv{S,E} <: AbstractEnvWrapper
    env::E
end

"""
    DefaultStateStyleEnv{S}(env::E)

Reset the result of `DefaultStateStyle` without changing the original behavior.
"""
DefaultStateStyleEnv{S}(env::E) where {S,E} = DefaultStateStyleEnv{S,E}(env)

RLBase.DefaultStateStyle(::DefaultStateStyleEnv{S}) where {S} = S

RLBase.state(env::DefaultStateStyleEnv{S}) where S = state(env.env, S)
RLBase.state(env::DefaultStateStyleEnv{S}, player) where S = state(env.env, S, player)