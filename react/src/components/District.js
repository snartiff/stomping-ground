import React from 'react';

const District = props => {
  let path = `districts/${props.id}`;
  return (
    <li>
      <a href={path}>{props.name}</a>
    </li>
  );
}

export default District;
