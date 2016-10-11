// App.js
import React, { Component } from 'react';
import DistrictForm from './DistrictForm';
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
    this.handleButtonClick = this.handleButtonClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount() {
    $.ajax({
      type: "POST",
      url: '/districts',
    })
    .done(data => {
      this.setState({ name: data.name })
    })
  }

  handleFormSubmit(event) {
    event.preventDefault();
    let newDistrict = {
      id: Date.now(),
      name: this.state.name,
      description: this.state.description
    };
    let newDistricts = [...this.state.districts, newDistrict];
    this.setState({
      districts: newDistricts,
      name: '',
      description: ''
    });
  }

  handleButtonClick(id) {
    let newDistricts = this.state.districts.filter(district=> {
      return district.id !== id;
    });
    this.setState({ districts: newDistricts });
  }

  handleChange(event) {
    let newName = event.target.value;
    this.setState({ name: newName });
  }

  render() {
    return(
      <div>
        <h1>District List React</h1>
        <DistrictForm
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          name={this.state.name}
          description={this.state.description}
        />
        <DistrictList
          districts={this.state.districts}
          handleButtonClick={this.handleButtonClick}
        />
      </div>
    );
  }
}

export default App;
