#!/usr/bin/awk -f
# grader.awk - AWK script for Assignment 3
# Processes student grade data to do all 5 Tasks

BEGIN {
    FS = ",";  
    print "Assignment 3: AWK processing\n"
}

# Function to calculate average
function calculate_average(total, count) {
    return total / count;
}

{
    # Skip the header line
    if (NR == 1) {
        next;
    }

    id = $1;
    name = $2;

    names[id] = name;

    total = 0;

    # Task 1, storing the totals in associative array
    for (i = 3; i <= NF; i++) {
        total += $i;
    }

    scores[id] = total;
    averages[id] = calculate_average(total, NF - 2);

    # Determine pass or fail (Task 2)
    if (averages[id] >= 70) {
        status[id] = "Pass";
    } else {
        status[id] = "Fail";
    }

    # Track the highest and lowest scoring students (Task 3)
    if (NR == 2 || total > max_score) {
        max_score = total;
        top_student = id;
    }

    if (NR == 2 || total < min_score) {
        min_score = total;
        low_student = id;
    }
}

END {
    # Print results as speciefied in Task 4
    for (id in scores) {
        printf "Name: %s\n", names[id];
        printf "Total Score: %d\n", scores[id];
        printf "Average Score: %.2f\n", averages[id];
        printf "Status: %s\n\n", status[id];
    }

    # Task 5, printing the highest and lowest scoring students
    print "-------------------------------"
    print "Top and Lowest Scoring Students\n"
    printf "Top Scorer: %s with %d points\n", names[top_student], max_score;
    printf "Lowest Scorer: %s with %d points\n", names[low_student], min_score;
}
