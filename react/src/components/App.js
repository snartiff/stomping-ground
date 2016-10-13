import React, { Component } from 'react';
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

  render() {
    return(
      <div>
        <DistrictList
          districts={this.state.districts}
        />
      </div>
    )
  }
}

export default App;
