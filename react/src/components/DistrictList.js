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
        let image;
        if (district.avatar == null) {
          image = "https://s-media-cache-ak0.pinimg.com/originals/56/7d/fa/567dfadfa0238e42e6f59efa9c01f504.jpg";
        } else if (district.avatar.url === "/fallback/default.png") {
          image = "https://s-media-cache-ak0.pinimg.com/originals/56/7d/fa/567dfadfa0238e42e6f59efa9c01f504.jpg";
        } else {
          image = district.avatar.url;
        }

        return (
          <District
            key={district.id}
            id={district.id}
            name={district.name}
            description={district.description}
            picture={image}
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
