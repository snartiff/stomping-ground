import React from 'react';

const DistrictForm = props => {
  return (
    <form onSubmit={props.handleFormSubmit}>
      <input
        type="text"
        placeholder="name of district"
        value={props.name}
        onChange={props.handleChange}
      />
      <input type="submit" value="Add District" />
    </form>
  );
};

export default DistrictForm;
