import React, { Component } from 'react';
import District from './District';

class DistrictList extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let districtList = this.props.districts;
    let districts = ''

    if (districtList.length !== 0) {
      districts = districtList.districts.map(district => {
        return (
          <District
            key={district.id}
            id={district.id}
            name={district.name}
            description={district.description}
            />
        );
      });
    }

    return (
      <ul>{districts}</ul>
    )
  }
}

export default DistrictList;
