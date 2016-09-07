class Books extends React.Component {
  constructor(props) {
    super(props)

    // this.state = { books: this.props.books, authors: this.props.authors }
    this.state = { ...props }
  }

  handleChange() {
    let author_id = $("#author_id").val()

    let that=this

    $.getJSON("/books", { author_id: author_id }, function(json) {
      that.setState({books: json})
    })
  }

  render() {
    return (<div>
      <form className="navbar-form navbar-right">
        <div className="form-group">
          <select id="author_id" name="author_id" onChange={this.handleChange.bind(this)}>
          {this.state.authors.map((author) => <option value={author.id}>{author.name}</option>)}
          </select>
        </div>
      </form>
      <div id="books" className="row">
        {this.state.books.map((book) => <Book {...book}/>)}
      </div>
    </div>)
  }
}
