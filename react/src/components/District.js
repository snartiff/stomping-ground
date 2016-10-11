import React from 'react';

const District = props => {
  return (
    <li>
      {props.name}
      <button type="button" onClick={props.handleButtonClick}>Delete</button>
    </li>
  );
};

export default District;
