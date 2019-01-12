module Basic

using Flux

export device, use_gpu
export PositionEmbedding, Embed, getmask, broadcast_add
export Transformer, TransformerDecoder

export NNTopo, @nntopo_str, @nntopo
export Stack, show_stackfunc, stack

export logkldivergence, logcrossentropy, logsoftmax3d

device(x) = cpu(x)

function use_gpu(use::Bool)
    if use
        @eval using CuArrays
        @eval device(x) = gpu(x)
    else
        @eval device(x) = cpu(x)
    end
end

const ThreeDimArray{T} = AbstractArray{T, 3}
const TwoDimArray{T} = AbstractArray{T, 2}

#hack for gpu
include("./permutedims.jl")

include("./batchedmul.jl")
include("./position_embed.jl")
include("./mh_atten.jl")
include("./transformer.jl")
include("./topology.jl")
include("./stack.jl")
include("./embed.jl")
include("./loss.jl")
include("./extend3d.jl")


end
