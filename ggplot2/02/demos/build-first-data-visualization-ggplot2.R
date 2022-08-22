
### Build your First Data Visualization with Ggplot2


## Module: Exploring the Ggplot2 Data Visualization Package


## The Environment

# Get ggplot2 and its dependencies
install.packages('ggplot2')

# Activate ggplot2 in each session
library(ggplot2)


## Dataset Import

# Import the lures.csv dataset with the R Base tool
# Environment/ Import Dataset/ From Text (base)...
# StringsAsFactors = True


## The ggplot2 Syntax

library(ggplot2)

# Scatterplot implementation
ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_point()


## Modifying the Plot Appearance within the Geom

# Function arguments
?geom_point

# Shape type with two colors option (fill, colour)
ggplot(lures[1:10,], aes(QUANTITY, REVENUE)) +
  geom_point(shape = 21, colour = "black", 
             fill = "red", size = 5, stroke = 3)

# Shape with single color option
ggplot(lures[1:10,], aes(QUANTITY, REVENUE)) +
  geom_point(shape = 2, colour = "black", 
             size = 5)

# Available shapes
?points



## Module: Modifying a Ggplot

## Data Visualization Types and their Geoms

# Scatterplot
ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_point()

# Blank ggplot
ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_blank()

# Histogram
ggplot(lures, aes(REVENUE)) +
  geom_histogram()

# Alternative: Density plot
ggplot(lures, aes(REVENUE)) +
  geom_density()

# Modifying the bin size of the histogram
# Argument: 'bins' - the number of bins
ggplot(lures, aes(REVENUE)) +
  geom_histogram(bins = 40)

# Argument: 'binwidth' - bin interval
ggplot(lures, aes(REVENUE)) +
  geom_histogram(binwidth = 50)

# Argument: 'breaks' - exact caps
ggplot(lures, aes(REVENUE)) +
  geom_histogram(breaks = c(0, 100, 150, 300, 700))

# Box plot
ggplot(lures, aes(SHOP.ID, REVENUE)) +
  geom_boxplot()

# Alternative: Violin plot
ggplot(lures, aes(SHOP.ID, REVENUE)) +
  geom_violin()

# Bar chart
# Alternative: geom_col()
ggplot(lures, aes(SHOP.ID)) +
  geom_bar()


## Working on the Theme

# Built-in ggplot2 themes
# Resource: https://ggplot2.tidyverse.org/reference/index.html#section-themes

# Dark theme
ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_point() +
  theme_dark()

# R Base-like theme
ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_point() +
  theme_classic()

# Minimal theme
ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_point() +
  theme_void()

# Default ggplot2 theme
ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_point() +
  theme_grey()

# Extension library for extra themes
install.packages('ggthemes')
library(ggthemes)

ggplot(lures, aes(QUANTITY, REVENUE)) +
  geom_point() +
  theme_wsj()


## Manual Adjustments to the Theme

?theme

ggplot(lures, aes(x = QUANTITY, y = REVENUE, color = SHOP.ID)) +
  geom_point() +
  theme(axis.text = element_text(size = rel(1.25),
                                 angle = 25, face = "bold"),
        axis.ticks = element_line(size = 3),
        legend.key = element_rect(fill = "red"))


## Titles and Text Based Elements

ggplot(lures, aes(x = QUANTITY, y = REVENUE)) +
  geom_point() +
  ggtitle(label = "Revenue Dependency on Quantity",
          subtitle = "Linear Relation Between\nSold Quantity and Revenue")
          
ggplot(lures, aes(x = QUANTITY, y = REVENUE)) +
  geom_point() +
  labs(title = "Revenue Dependency on Quantity",
       subtitle = "Linear Relation Between\nSold Quantity and Revenue",
       caption = "Data collected from 9 American shops.",
       tag = "Happy Anglers Products")

# Access the visual settings via the theme()
ggplot(lures, aes(x = QUANTITY, y = REVENUE)) +
  geom_point() +
  ggtitle(label = "Revenue Dependency on Quantity",
          subtitle = "Linear Relation Between\nSold Quantity and Revenue") +
  theme(plot.title = element_text(hjust = 0.5))


## Guides of a Plot: Legends and Axes

# Legend content
?guide_legend

ggplot(lures, aes(x = QUANTITY, y = REVENUE, color = SHOP.ID)) +
  geom_point() +
  guides(color = guide_legend(title="Fishermen's Best\nStore ID",
                              label.position = "left",
                              reverse = T))

# Axis content (X, Y, continuous, discrete)
?scale_x_continuous

ggplot(lures, aes(x = QUANTITY, y = REVENUE, color = SHOP.ID)) +
  geom_point() +
  scale_x_continuous(name = "Item Quantity", breaks = c(3, 9, 16))















