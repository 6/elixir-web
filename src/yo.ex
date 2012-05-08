defmodule Yo do
  defmacro __using__(module, _opts) do
    root_folder = Keyword.get(_opts, :root, ".")

    quote do
      import Yo, only: [get: 2, post: 2]

      def start do
        Yo.start unquote(module)
      end
      
      defp public_root, do: unquote(root_folder)
    end
  end

  def start(_) do
    IO.puts "Executing Yo.start"
  end
  
  defmacro get(path, [do: code]) do
    quote do
      def handle(:get, unquote(path), _data) do
        unquote(code)
      end
    end
  end
  
  defmacro get(path, [file: bin]) when is_binary(bin) do
    quote do
      def handle(:get, unquote(path), _data) do
        file_path = File.join([public_root(), unquote(bin)])
        case File.read(file_path) do
        match: { :ok, data }
          { :ok, data }
        else:
          { :error, "404!" }
        end
      end
    end
  end

  defmacro post(path, [do: code]) do
    # hygiene:false lets us access _data variable in server
    quote hygiene: false do
      def handle(:post, unquote(path), _data) do
        unquote(code)
      end
    end
  end
end
