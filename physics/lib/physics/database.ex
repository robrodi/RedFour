defmodule Physics.Database do
	#Straight Erlang
	:mnesia.create_table(:user,[
		{:ramcopies, [node()]},
		{:attributes, [:name, :email, :first, :last]}
	 ])
end