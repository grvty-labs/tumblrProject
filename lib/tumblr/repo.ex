defmodule Tumblr.Repo do
  use Ecto.Repo, otp_app: :tumblr
  use Scrivener, page_size: 10
end
