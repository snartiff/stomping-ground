import React, { Component } from 'react';
import District from './District';
import DistrictList from './DistrictList';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      districts: []
    };
    this.refreshPage = this.refreshPage.bind(this);
  }

  componentDidMount() {
    this.refreshPage();
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
        <ul className="districts">
        <DistrictList
          districts={this.state.districts}
          />
        </ul>
      </div>
    )
  }
}

export default App;
