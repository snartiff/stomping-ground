import React, { Component } from 'react';
import Form from './Form';
import DistrictList from './DistrictList';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      districts: [],
      name: '',
      description: '',
      id: ''
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleDescription = this.handleDescription.bind(this);
    this.refreshPage = this.refreshPage.bind(this);
  }

  componentDidMount() {
    setInterval(this.refreshPage, 5000);
  }

  refreshPage() {
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
      console.log('posted!');
    }).error(data => {
      console.log('fail');
    });

    let newDistrict = {
      id: '',
      key: '',
      name: this.state.name,
      description: this.state.description
    }

    // let newDistricts = this.state.districts.districts
    // newDistricts.push(newDistrict)

    debugger;
    this.state.districts.districts.push(newDistrict)
    let newDistricts = this.state.districts

    this.setState({
      districts: newDistricts
    });

    debugger;
    this.state.name = ''
    this.state.description = ''
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
