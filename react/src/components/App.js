import React, { Component } from 'react';
import Form from './Form';
import DistrictList from './DistrictList';

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
    this.handleDescription = this.handleDescription.bind(this);
  }

  componentDidMount() {
    $.ajax({
      url: "api/districts",
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ districts: data })
    });
  }

  handleFormSubmit(event) {
    let formData = {name: this.state.name, description: this.state.description};
    $.ajax({
      type: 'POST',
      url: 'api/districts',
      data: {district: formData}

    }).success(data => {
      alert('Posted!');

      console.log('ajax hates me!')
    }).error(data => {
      debugger;
      alert('fail');
    });

    let newDistrict = {
      id: '',
      name: this.state.name,
      description: this.state.description
    }
    this.state.districts.districts.push(newDistrict)
    let newDistricts = this.state.districts

    this.setState({
      districts: newDistricts
    });

    event.preventDefault();
  }

  handleChange(event) {
    let newName = event.target.value;
    this.setState({ name: newName });
  }

  handleDescription(event) {
    let newDescription = event.target.value;
    this.setState({ description: newDescription });
  }

  render() {

    return(
      <div>
        <h1>District Homepage</h1>
        <DistrictList
          districts={this.state.districts}
        />

        <Form
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          handleDescription={this.handleDescription}
          name={this.state.name}
          description={this.state.description}
          />
      </div>
    )
  }
}

export default App;
