// GroceryList.js
import React from 'react';
import District from './District';

const DistrictList = props => {
  let districts = props.districts.map(district => {
    const { id, name, description } = district;
    let onButtonClick = () => props.handleButtonClick(id);

    return (
      <District
        key={id}
        name={name}
        description={description}
        handleButtonClick={onButtonClick}
      />
    );
  });

  return (
    <ul>
      {districts}
    </ul>
  );
};

export default DistrictList;
