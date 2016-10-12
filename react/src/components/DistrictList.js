import React, { Component } from 'react';
// import React from 'react';
import District from './District';

class DistrictList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      districts: [],
      name: ''
    };
  }
  //
  // componentDidMount() {
  //   $.ajax({
  //     url: "api/districts",
  //     contentType: 'application/json'
  //   })
  //   .done(data => {
  //     debugger;
  //     this.setState({ districts: data })
  //   });
  // }

  render() {
    let districtList = this.state.districts;

      debugger;
      let districts = districtList.districts.map(district => {
        return (
          <District
            key={district.id}
            id={district.id}
            name={district.name}
            description={district.description}
            />
        );
      });

    return (
      <ul>{districts}</ul>
    )
  }

}

// const DistrictList = props => {
//   debugger;
//   let districts = props.districts.districts.map(district => {
//     const { id, name, description } = district;
//
//     return (
//       <District
//         key={id}
//         id={id}
//         name={name}
//         description={description}
//         />
//     );
//   });
//
//   return(
//     <ul>
//     {districts}
//     </ul>
//   );
// };

export default DistrictList;
