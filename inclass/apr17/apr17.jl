### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ e7b88f40-d3e0-4aee-b7ca-c564a265381b
using PlutoUI

# ╔═╡ 0e78e534-dc69-11ed-2b88-f98758b4e0a6
md"""### Filter design

Consider a sinusoid constructed from summing a 30 Hz cosine and 60 Hz sine wave.

```math
x(t) = \cos(2\pi30t) + \sin(2\pi60t)
```

We are going to filter this signal using a 60 Hz notch filter to eliminate the higher frequency content. 

We will do this three different ways:

1. Using transfer function models
2. In Simulink 
3. Using the filter design app

"""

# ╔═╡ d1437512-ca94-497d-8a57-511bcfef3da9
md"""## Transfer function approach

Recall the transfer function given in Exam 2. 

```math
G(s) = \dfrac{s^2+3600}{s^2+120s+3600}
```
Follow these steps in MATLAB

1. Construct $x(t)$ above in MATLAB using a time vector of frequency 1 kHz and running from 0 to 0.5 seconds. 
1. Create the above transfer function in MATLAB using the [`tf`](https://www.mathworks.com/help/control/ref/tf.html) command. 
2. Convert this continuous time model to a discrete time model using the [`c2d`](https://www.mathworks.com/help/ident/ref/dynamicsystem.c2d.html) command; be sure to specify the _correct_ sampling time `Ts`. The transfer function is for rad/s while in discrete time MATLAB uses Hz. 
3. Extract the numerator and denominator coefficients from the converted model and pass those to the [`filtfilt`](https://www.mathworks.com/help/signal/ref/filtfilt.html) command to filter `x`. Call this output `y`. 
4. Plot both `x` and `y` on the same graph. 

"""

# ╔═╡ 85690f35-96b4-43c2-bdd3-d68421ec1cd9
md""" Here is some starter code:

```matlab
t = ___;
x = ___;

gain = 1;
p7num = gain* ___;
p7den = ___;
p7tf = tf(p7num, p7den);
dt_tf = c2d(p7tf, ___);
y = filtfilt(dt_tf.Numerator{:}, dt_tf.Denominator{:}, ___);
.
.
.
```


"""

# ╔═╡ 69989f1a-a699-4a1f-9070-4d3f0a26cb1c
md"""
Questions:

* How can we get the output to be similar in magnitude to the input?
* Does the output seem time shifted? How could we take care of this?
  - Look up the [`grpdelay`](https://www.mathworks.com/help/signal/ref/grpdelay.html) command. It might be useful for your project.
"""

# ╔═╡ 940f615f-e5d0-4e09-97a8-939d70eb874f
md"""## Simulink approach

Perform the same exercise in Simulink. Here is a starter diagram:
"""

# ╔═╡ c028efd4-688b-46c2-b250-594b53860c71
Resource("https://i.ibb.co/GvkKhXM/Screenshot-2023-04-16-at-10-53-15-AM.png")

# ╔═╡ bc822d1a-abc8-4e96-a04a-3d68b42062f0
md""" Remember ...

1. Phase shift the sine block to get a cosine wave. 
2. Sine block is in rad/s
3. The square box above is a gain slider. You can use a standard gain. 
4. You would need to modify the scope block to increase number of accepted inputs; but you probbaly want to output the variable to MATLAB workspace for making subplots. 
"""

# ╔═╡ 84eaa38d-a9c8-49a4-ab25-3de8cd206066
md"""## Use the filter design app

This section requires the use of the Signal Processing Toolbox. To start the filter designer tool run `filterDesigner` command from the MATLAB command window. 

```>> filterDesigner```

Then, create a filter with the following specifications:
"""

# ╔═╡ 60d80d61-9fd4-4973-8bda-39b2adc5c9cc
Resource("https://i.ibb.co/k6kCr67/Screenshot-2023-04-16-at-11-20-15-AM.png")

# ╔═╡ d2365262-14b9-4633-b698-a408b0431d96
md"""
Next

1. From the `File` menu export this filter as a MATLAB function (give an appropriate name of your choosing). Save it as a `.m` file. 
2. Call this function to create a `1x1 df2` filter object in your MATLAB workspace. 
3. Use the created filter object from your Workspace to filter your `x` variable and save the result to `y`. For this use our old friend the `filter` command (see: the [Tips section](https://www.mathworks.com/help/matlab/ref/filter.html#bt_7huw-5)).
4. Plot both of them on the same figure as before. 


Compare the outputs of the first method and this one. What is different?
"""

# ╔═╡ e2ad534a-ef4f-41e9-8cfc-3b4d5e7272b3
md"""## To turn in ...

Generate a single figure with three subplots consisting of figures from each of the three methods above. For example

```
subplot(1, 3, 1)
.
.
.
title("Output using TF method")
.
.
subplot(1, 3, 3)
.
.
title("Output from filter designer")
```
Answer questions above. 
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.50"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "d8b0bbb312600ec81f2769bd72048a77429debd9"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "478ac6c952fddd4399e71d4779797c538d0ff2bf"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.8"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "5bb5129fdd62a2bbbe17c2756932259acf467386"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.50"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"

[[deps.URIs]]
git-tree-sha1 = "074f993b0ca030848b897beff716d93aca60f06a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╠═e7b88f40-d3e0-4aee-b7ca-c564a265381b
# ╟─0e78e534-dc69-11ed-2b88-f98758b4e0a6
# ╟─d1437512-ca94-497d-8a57-511bcfef3da9
# ╟─85690f35-96b4-43c2-bdd3-d68421ec1cd9
# ╟─69989f1a-a699-4a1f-9070-4d3f0a26cb1c
# ╟─940f615f-e5d0-4e09-97a8-939d70eb874f
# ╟─c028efd4-688b-46c2-b250-594b53860c71
# ╟─bc822d1a-abc8-4e96-a04a-3d68b42062f0
# ╟─84eaa38d-a9c8-49a4-ab25-3de8cd206066
# ╟─60d80d61-9fd4-4973-8bda-39b2adc5c9cc
# ╟─d2365262-14b9-4633-b698-a408b0431d96
# ╟─e2ad534a-ef4f-41e9-8cfc-3b4d5e7272b3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
