import React, { Component } from 'react';
import Form from './Form';
import District from './District';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      districts: [],
      name: '',
      description: ''
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount() {
    $.ajax({
      url: "api/districts",
      contentType: 'application/json'
    })
    .done(data => {

      debugger;
      this.setState({ name: data.name })
    });
  }

  handleFormSubmit(event) {
    event.preventDefault();
    let newDistrict = {
      id: '',
      name: this.state.name,
      description: this.state.description
    }
    let newDistricts = [...this.state.districts, newDistrict];
    this.setState({
      districts: newDistricts,
      name: '',
      description: ''
    });
  }

  handleChange(event) {
    let newName = event.target.value;
    this.setState({ name: newName });
  }

  render() {
    let districtList = this.state.districts;
    return(
      <div>
        <h1>District Homepage</h1>
        <Form
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          name={this.state.name}
          description={this.state.description}
          />

        <ul className="districts">
          {this.state.districts}
        </ul>
      </div>
    )
  }
}

export default App;
