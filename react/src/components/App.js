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
  }

  // getInitialState() {
  //   return { data: {districts:[]}};
  // }

  componentDidMount() {
    $.ajax({
      url: "api/districts",
      contentType: 'application/json'
    })
    .done(data => {
      debugger;
      this.setState({ districts: data })
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
    // let districtOne = districtList.districts[0].name

    debugger;


    return(
      <div>
        <h1>District Homepage</h1>
        <Form
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          name={this.state.name}
          description={this.state.description}
          />

        <DistrictList
          districts={this.state.districts}
        />

      </div>
    )
  }
}

export default App;
