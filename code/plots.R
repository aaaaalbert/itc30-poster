library(ggplot2)
setwd("itc30-poster/data")

#######################################################################
# RSSI overall und top gateway
#######################################################################

rssi.all <- read.csv("rssi_distribution.csv")
rssi.top <- read.csv("topgw_rssi_distribution.csv")

ggplot(rssi.all, aes(x = RSSI.in.dBm)) +
  geom_col(aes(y=count)) + # scale_y_log10() +
  geom_col(data=rssi.top, aes(x=rssi.in.dBm, y=count), fill="cyan", ) +
  labs(x="RSSI [dBm]", y="Number of messages") +
  theme(text = element_text(size=12))
ggsave("../figures/rssi.pdf", device = cairo_pdf, width=12, height=8)



#######################################################################
# Transmit frequencies
#######################################################################

qrg.all <- read.csv("transmit_frequency_count.csv")
qrg.top <- read.csv("topgw_transmit_frequency_count.csv")

ggplot(qrg.all, aes(x=xmit.freq.MHz)) + geom_col(aes(y=count)) +
  geom_col(data=qrg.top, aes(x=xmit.freq.MHz, y=count), fill="cyan") +
  # scale_x_continuous(limits=c(867.1, 868.5), breaks=sort(qrg.all$xmit.freq.MHz), labels=as.character(sort(qrg.all$xmit.freq.MHz))) +
  labs(x="Transmit frequency [MHz]", y="Number of messages") + # scale_y_log10() +
  theme(text = element_text(size=12))
ggsave("../figures/qrg.pdf", device = cairo_pdf, width=12, height=8)



#######################################################################
# Message size distribution
#######################################################################

sizes <- read.csv("message_size_count.csv")


ggplot(sizes, aes(x=message.size)) + geom_col(aes(y=count)) +
  labs(x="Message size [bytes]", y="Number of messages (log scale)") +
  scale_y_log10() +
  # scale_x_log10() +
  theme(text = element_text(size=12))
ggsave("../figures/sizes.pdf", device = cairo_pdf, width=12, height=8)

