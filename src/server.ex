defmodule HelloServer do
  use Yo

  get "/" do
    { :ok, "Hello world!" }
  end
end
