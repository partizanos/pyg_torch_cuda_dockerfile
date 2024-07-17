import torch
from torch_geometric.nn import GCNConv
from torch_geometric.data import Data

print("CUDA available:", torch.cuda.is_available())

# Create a simple graph
edge_index = torch.tensor([[0, 1], [1, 0]], dtype=torch.long)
x = torch.tensor([[-1], [1]], dtype=torch.float)
data = Data(x=x, edge_index=edge_index)

# Define a GCN layer and apply it to the graph data
conv = GCNConv(1, 2)
out = conv(data.x, data.edge_index)
print("Graph convolution output:", out)
