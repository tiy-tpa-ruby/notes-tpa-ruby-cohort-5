class Book extends React.Component {
  render() {
    return (<div className="col-md-4">
      <div className="book-panel">
        <h2>{this.props.title}</h2>
        <ul className='categories'>
        </ul>
        <p className="year">{this.props.editor}, {this.props.year}</p>
        <p className="price">{this.props.prices}</p>
      </div>
    </div>)
  }
        // <p class="authors">{book.authors}<%= book.authors.map(&:name).to_sentence %></p>
          // <% book.categories.each do |category| %>
          //   <li><%= category.name %></li>
          // <% end %>
}
