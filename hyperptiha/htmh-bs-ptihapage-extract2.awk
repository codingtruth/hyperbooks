#!/bin/awk -f

// {gsub(/<h4>/, "\n<h4>")}
// {gsub(/<p><b>/, "\n<p><b>")}
// {gsub(/<a id='a[0-9]+'><\/a>/, "")}
// {gsub(/<br \/>/, "")}
// {print}