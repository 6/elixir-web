defmodule HelloServer do
  use Yo

  get "/" do
    { :ok, "Hello world!" }
  end

  post "/" do
    { :ok, "Post!\n_data is: #{inspect _data}" }
  end
end
