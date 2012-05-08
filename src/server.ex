defmodule HelloServer do
  use Yo

  get "/" do
    { :ok, "Hello world!" }
  end

  get "/demo", file: "demo.html"

  post "/" do
    { :ok, "Post!\n_data is: #{inspect _data}" }
  end
end
