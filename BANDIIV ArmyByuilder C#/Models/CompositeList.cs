namespace BandiIVWebApiGetter.Models
{
    public class CompositeList
    {
        public string Id { get; set; }
        public string ParentId { get; set; }
        public string Text { get; set; }
        public bool IsCommand { get; set; }
        public bool IsExpanded { get; set; }
        public bool HasChildren { get; set; }
        public CompositeList(string id, string parentId, string unitName, bool isCommand)
        {
            if (parentId== Guid.Empty.ToString())
            { 
                // deliberately blank
            }
            else
            { ParentId = parentId; }
            Id = id;
            Text = unitName;
            IsCommand = isCommand;
            IsExpanded = isCommand;
            HasChildren = isCommand;
        }
    }

}
