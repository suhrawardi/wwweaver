use Amnesia

defdatabase Wwweaver.Database do

  def initialize do
    Wwweaver.Database.Destroy.run
    Wwweaver.Database.Create.run
  end

  deftable MPage, [{ :id, autoincrement }, :uri],
           type: :ordered_set, index: [:uri] do
    @type t :: MPage[id: non_neg_integer, uri: String.t]

  end
end
