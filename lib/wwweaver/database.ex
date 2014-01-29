use Amnesia

defdatabase Wwweaver.Database do

  deftable MPage, [{ :id, autoincrement }, :uri],
           type: :ordered_set, index: [:uri] do
    @type t :: MPage[id: non_neg_integer, uri: String.t]

  end
end
